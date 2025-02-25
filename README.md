# jlpt-roku

Rather than create thousands of flash cards, this app allows you to practice your vocabulary on a normal tv with a Roku.

It's fairly primitive, but could be improved.

I started poking at my Roku last year and have found it simple to develop for and convenient to use. I am seeing indications that Roku is clamping down on users running their own applications, even if piracy is not involved. The impression I get is that they only want cash cows.

# Build And Run

1. [First you need a roku dev account and a roku device set up in development mode.](https://developer.roku.com/docs/developer-program/getting-started/first-steps.md)
1. Run the `scripts/update-app.py` script. This generates most of the assets and brightscript code required by the app, and which aren't checked into `git`. See [Current Status and TODO, below](#current-status-and-todo).
1. Normal Roku development practice should then apply (build the package via `make` and upload). That's outside the scope of this document.
1. I've included a `.vscode/extensions.json` and `.vscode/launch.json` that should make development in VSCode much easier. The `launch.json` relies on defining the `ROKU_DEV_TARGET` and `DEVPASSWORD` env variables which should apply to your target Roku device.

# Current Status and TODO

I'm preparing for N3 in summer 2025, so I'll be updating this app from time to time as I study.

It lacks the following:

* No scoring system or user improvement tracking
* All japanese text is currently displayed by pre-rendered images, making the app very large (~50MB) and development mode only (production apps are limited to 4MB). This is because Roku does not support CJK text out of the box. I have a solution in mind for this (a custom bitmap font), but am unsure if I'll take the time to do it.
* Flashcards need some aesthetic improvement and maybe animation.
* Screenshots. My roku web interface (typically used to screenshot) doesn't currently work across multiple accounts and system resets. Either it got broken or I'm banned in some way.