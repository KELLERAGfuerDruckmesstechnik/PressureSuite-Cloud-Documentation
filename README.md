# Introduction

This are the resource files for the documentation web page for the KOLIBRI Cloud. The compiled result can be seen on <https://docs.kolibricloud.ch>

It is build using markdown files (in /content/...) and the Hugo project (<https://gohugo.io/)> to transform it to HTML.
The template was taken from <https://github.com/brocaar/docs.loraserver.io>

## Getting Started

To deploy a change you basically have to change the markdown files and `git push`. Or wait for the accepted push request.

To test the page locally do this:

1. Choose the folder you want to change (e.g. /docs.kolibricloud.ch.keller-devices/)
2. To start Hugo as a web-server (auto-refreshing on file-change), run the following command from the root of this repository: `hugo server -w` (when not on windows you have to install hugo first and use the installed binary)
3. Make your changes in the files and see the changes on the local Web Server on <http://localhost:1313/> (or another port)

## Deployment

Azure DevOps Services is used to automatically build the static file (buildStaticFiles.ps1) and deploy it to a cheap Azure storage.
[![Build Status](https://kellerdruck.visualstudio.com/Keller%20Cloud/_apis/build/status/Documentation%20-%20CI)](https://kellerdruck.visualstudio.com/Keller%20Cloud/_build/latest?definitionId=27)

## Kudos

Big thanks to [Orne Brocaar](https://github.com/brocaar) for letting me use his Hugo template.
