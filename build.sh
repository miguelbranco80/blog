#!/bin/bash
rm -rf docs
hugo -d docs
echo "notes.spacebase.org" > docs/CNAME
git add docs/
