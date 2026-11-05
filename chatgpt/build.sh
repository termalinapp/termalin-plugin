#!/bin/sh
# Builds the ChatGPT plugin package (termalin-chatgpt-plugin.zip): this
# folder's manifest and app link plus the same skills/ and assets/ the
# Claude plugin ships, so the two never drift apart.
set -e
cd "$(dirname "$0")"
out=build/termalin
rm -rf build && mkdir -p "$out"
cp plugin.json .app.json "$out/"
cp -r ../skills ../assets "$out/"
( cd build/termalin && python -c "import zipfile,os
z=zipfile.ZipFile('../termalin-chatgpt-plugin.zip','w',zipfile.ZIP_DEFLATED)
for r,_,fs in os.walk('.'):
    for f in fs: z.write(os.path.join(r,f), os.path.relpath(os.path.join(r,f),'.'))
z.close()" )
echo "built chatgpt/build/termalin-chatgpt-plugin.zip"
