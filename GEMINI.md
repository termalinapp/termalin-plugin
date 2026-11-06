# Termalin

The `termalin` MCP server reaches the user's own Linux servers through Termalin Connectors: `hosts_list` shows the reachable servers, `ssh_exec` / `ssh_exec_many` run a command, `job_*` run long commands in the background, `sftp_list` / `sftp_read` / `sftp_write` handle files, `data_*` query databases, `server_metrics` and `alerts_list` read monitoring data. No SSH key or password is needed in the chat; access comes from the user's termal.in account over OAuth, and each connection has a policy (full, allowlist or read-only) set by the user.

Before running anything on a server, read the relevant skill in `skills/`: `server-health` for "how are my servers doing", `incident-triage` for an alert or outage, `run-commands` for the rules of running commands and editing files safely, `deploy-check` after a deployment, `database-access` for database questions. Read-only first, bounded output, a backup before a config edit, and ask before any destructive command.
