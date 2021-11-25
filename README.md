<br/>
<p align="center">
  <h3 align="center">Discord Cache Cleaner</h3>
</p>

![Downloads](https://img.shields.io/github/downloads/danielytuk/Discord-Cache-Cleaner/total) ![Forks](https://img.shields.io/github/forks/danielytuk/Discord-Cache-Cleaner?style=social) ![Stargazers](https://img.shields.io/github/stars/danielytuk/Discord-Cache-Cleaner?style=social) 

## About The Project

Discord stores **every, single, image** you view onto your hard drive; and this can lead to bad things, especially if someone sends you questionable material.
This script eliminates those issues, by automatically deleting all the files; on a timed schedule, the schedule is done via Windows Task Scheduler.

You may of noticed the Windows word; well, sadly, I have no experience with other platforms.
Please gladly submit a PR; for that specific platform; thanks 💖

## Important

I highly recommend watching [this video](https://youtu.be/usjic7nK_as); it's hard to explain in text form.


## Alert

When your adding the Discord file to start automatically;
In the argument box; paste this `--processStart Discord.exe --process-start-args --start-minimized`

Change `Discord.exe` to the version, you're using.
I'll eventually make this automated.

and, also - copy the program path, without the quotations into `Start in`.
