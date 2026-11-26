# Installing the Termalin MCP server

Termalin is a hosted MCP server: there is nothing to build or run locally.

1. The user needs a Termalin account at https://termal.in/account and at least one Linux server enrolled with a Termalin Connector (the account page gives a one-line install command to run on the server; outbound only, no inbound port). The Free plan covers one server; the hosted MCP server needs Pro or the 14-day trial.
2. Add the remote server to the MCP client configuration:

```json
{
  "mcpServers": {
    "termalin": {
      "type": "streamable-http",
      "url": "https://termal.in/mcp"
    }
  }
}
```

   Clients that write `"type": "http"` or `"transport": "http"` use the same URL.
3. On first use the client opens the Termalin sign-in page (OAuth 2.1 with PKCE and dynamic client registration; no client id or API key to paste). The user signs in, ticks the servers the client may reach and approves.
4. For clients without OAuth support (CI, scripts), create an API key in the account page ("API keys & MCP") and send it as `Authorization: Bearer <key>` to the same URL.
5. For clients that only start local stdio servers, use the open-source bridge [termalin-mcp](https://github.com/termalinapp/termalin-mcp) (npm, MIT, Node 18+, no dependencies). It forwards every message to the hosted server with the API key from the environment; the key never goes on the command line:

```json
{
  "mcpServers": {
    "termalin": {
      "command": "npx",
      "args": ["-y", "termalin-mcp"],
      "env": { "TERMALIN_API_KEY": "tk_live_..." }
    }
  }
}
```

Check: call `hosts_list`; it returns the enrolled servers (the server has 36 tools in all). `ssh_exec` with `uptime` on one of them returns the output and exit code 0.

Policy: every connection has a command policy set by the user in the account page (full, allowlist or read-only); write tools are refused under read-only. The skills in `skills/` describe how to use the tools safely.
