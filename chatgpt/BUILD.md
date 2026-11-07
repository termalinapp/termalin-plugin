# Building the ChatGPT plugin package

The ChatGPT / Codex package is a ZIP in OpenAI's plugin layout: `.codex-plugin/plugin.json`, `.mcp.json`, plus the same `skills/` and `assets/` the Claude plugin ships, so the two never drift apart. There is no script in this repository on purpose (the Claude directory accepts only text, JSON, YAML and image files); run these commands from the `chatgpt/` folder:

```
rm -rf build && mkdir -p build/termalin/.codex-plugin
cp .codex-plugin/plugin.json build/termalin/.codex-plugin/
cp .mcp.json build/termalin/
cp -r ../skills ../assets build/termalin/
cd build/termalin && zip -r ../termalin-chatgpt-plugin.zip . && cd ../..
```

Upload `build/termalin-chatgpt-plugin.zip` at platform.openai.com → Plugins → Termalin → "Upload plugin to make changes". The `build/` folder is a local artifact; do not commit it.
