# Release Checklist
1. Update & run relevant unit tests ([TestEZ Companion](https://github.com/tacheometry/testez-companion) recommended)
2. Update relevant documentation (we use [Moonwave](https://github.com/evaera/moonwave))
2. Change the versions in `wally.toml`
3. update `CHANGELOG.md` with brief description of changes
4. Commit `git add . && git commit -m "Release vX.Y.Z"`
5. Tag `git tag vX.Y.Z`
6. Push `git push && git push --tags`
7. Update release information if needed (usually w/ link to changelog)