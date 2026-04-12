Set up MCP servers for this project. MCP servers let Claude connect to external tools — GitHub, browser automation, databases, etc.

1. Show the user this menu and ask which they want (they can pick multiple):

   ```
   Common MCP servers:
   a) GitHub — create issues, PRs, read repo data
   b) Playwright — browser automation, visual inspection of frontend work
   c) Filesystem — read/write files outside the project root
   d) Other — I'll enter a name/URL manually
   ```

2. For each selected server, run the appropriate `claude mcp add` command via Bash:

   - **GitHub**:
     ```
     claude mcp add --transport http github https://api.githubcopilot.com/mcp/
     ```
   - **Playwright**:
     ```
     claude mcp add --transport http playwright https://playwright.azurewebsites.net/mcp/
     ```
   - **Filesystem**:
     ```
     claude mcp add filesystem npx -- -y @modelcontextprotocol/server-filesystem /path/to/allow
     ```
     (Ask the user which path(s) to allow first.)
   - **Other**: ask for the server name, transport type, and URL, then run the appropriate `claude mcp add` command.

3. After adding each server, tell the user which ones use OAuth vs API keys:
   - **OAuth** (GitHub, most cloud services): Tell them to type `/mcp` in Claude Code — it opens a browser to log in. No key needed.
   - **API key**: Tell them to set the key as an environment variable and use `${VAR_NAME}` syntax in `.mcp.json` to keep it out of version control.
   - **No auth** (Playwright, filesystem): Ready to use immediately.

4. Confirm all servers were added: run `claude mcp list` and show the result.

5. Remind them that `Mcp` is already in `permissions.allow` in `settings.json` — no config change needed.
