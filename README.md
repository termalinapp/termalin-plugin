# Termalin for Claude

Manage your own Linux servers from a conversation with Claude: run commands over SSH, read and write files over SFTP, query databases, and watch server health and alerts — through the [Termalin](https://termal.in) connector, without pasting an SSH key or a password into the chat.

This plugin bundles the Termalin MCP connector (`https://termal.in/mcp`) with five skills that teach Claude how to use it well:

| Skill | What it does |
| --- | --- |
| `server-health` | Answers "how are my servers doing" from Termalin's monitoring data (CPU, memory, disk, load, failed services, certificates, alerts) before running anything. |
| `incident-triage` | Works through an alert or outage step by step, read-only first, and asks before any fix. |
| `run-commands` | The rules for running commands and editing files safely: bounded output, background jobs for long tasks, backups before config edits, no secrets in the chat, no destructive commands without a yes. |
| `deploy-check` | Verifies a server after a deployment: services, ports, logs, external response, certificate, metrics. |
| `database-access` | Explores and queries Postgres, MySQL/MariaDB, Redis, MongoDB and SQLite on a server, read-only by default. |

## Use it

1. Sign in at [termal.in](https://termal.in/account) and install a Connector on a server (one command, no inbound port). The Free plan is enough to try it.
2. Add this plugin, then connect the Termalin connector from the plugin's **Connectors** tab and approve access on the consent screen.
3. Ask Claude: "Are all my servers online?", "Check disk space on prod", "Tail the nginx error log and explain the errors", "What's in the orders table?", "I just deployed the API, is it fine?".

Each connection has a policy you set in your Termalin account (full access, an allowlist of commands, or read-only), a note that tells Claude what to be careful with on that server, and a full audit trail of every command. You can disconnect Claude from your account page at any time.

## Data

The plugin itself stores nothing and runs no code on your machine. The commands, file contents and query results Claude requests travel from your server through its Termalin Connector to `termal.in` and back to the chat. Access is granted through OAuth from your Termalin account; each command is authenticated with a short-lived certificate issued by Termalin's SSH CA. See the [privacy policy](https://termal.in/privacy) and [terms](https://termal.in/terms).

## Works with

The Termalin desktop app (Windows, macOS, Linux), the iOS app and the web cabinet — none of them needs to be open for the plugin to work. Support: [termal.in/support](https://termal.in/support) · support@termal.in
