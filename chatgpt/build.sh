#!/bin/sh
# Builds the ChatGPT plugin package (termalin-chatgpt-plugin.zip) in the layout
# OpenAI's own plugins use: .codex-plugin/plugin.json and the MCP server
# (.mcp.json), plus the same skills/ and
# assets/ the Claude plugin ships, so the two never drift apart.
set -e
cd "$(dirname "$0")"
out=build/termalin
rm -rf build && mkdir -p "$out/.codex-plugin"
cp .codex-plugin/plugin.json "$out/.codex-plugin/"
cp .mcp.json "$out/"
cp -r ../skills ../assets "$out/"
( cd build/termalin && python -c "import zipfile,os
z=zipfile.ZipFile('../termalin-chatgpt-plugin.zip','w',zipfile.ZIP_DEFLATED)
for r,_,fs in os.walk('.'):
    for f in fs: z.write(os.path.join(r,f), os.path.relpath(os.path.join(r,f),'.'))
z.close()" )
echo "built chatgpt/build/termalin-chatgpt-plugin.zip"
