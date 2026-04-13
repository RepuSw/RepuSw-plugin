#!/bin/bash

# 從 stdin 讀取 Claude Code 傳遞的 JSON 內容
INPUT=$(cat)

# 提取即將執行的指令
CMD=$(echo "$INPUT" | jq -r '.tool_input.command')

# 定義危險指令特徵（例如：強制刪除、格式化、修改權限）
if [[ "$CMD" == *"rm -rf"* ]] || [[ "$CMD" == *"mkfs"* ]] || [[ "$CMD" == *"chmod 777"* ]] || \
   [[ "$CMD" == *"git push --force"* ]] || [[ "$CMD" == *"git push -f"* ]] || \
   [[ "$CMD" == *"DROP TABLE"* ]] || [[ "$CMD" == *"DROP DATABASE"* ]] || \
   [[ "$CMD" =~ curl.*\|.*sh ]] || [[ "$CMD" =~ wget.*\|.*sh ]]; then
  # 將錯誤訊息輸出到 stderr（這會回傳給 Claude 模型）
  echo "安全攔截：偵測到危險指令 '$CMD'。請改用更安全的替代方案，或要求使用者手動執行。" >&2

  # 以 exit 2 退出，正式阻擋指令執行
  exit 2
fi

# 若安全無虞，以 exit 0 退出，允許 Claude 執行
exit 0
