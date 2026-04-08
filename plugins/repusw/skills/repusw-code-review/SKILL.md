---
name: repusw-code-review
description: Review code for best practices, potential bugs, security concerns, and improvements. Use when reviewing code, checking PRs, or analyzing code quality.
---

# Code Review

When reviewing code, thoroughly check for:

1. **Code Organization** - Structure, modularity, and separation of concerns
2. **Error Handling** - Proper error handling, edge cases, and graceful degradation
3. **Security** - Input validation, injection vulnerabilities, authentication/authorization issues
4. **Performance** - Inefficient algorithms, unnecessary allocations, N+1 queries
5. **Test Coverage** - Missing tests, edge case coverage, test quality
6. **Naming & Readability** - Clear variable/function names, self-documenting code

Provide actionable feedback with specific line references. Prioritize issues by severity (critical > major > minor > suggestion).
