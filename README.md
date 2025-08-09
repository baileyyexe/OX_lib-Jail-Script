# OX_Lib Jail Script

A simple FiveM jail script using OX_Lib with password protection.

## Author
Bailey

## Features
- Jail players with `/jail` command.
- Password-protected access (`MET123` by default).
- Prevents escape with automatic teleport back.
- Customizable jail time and reason.

## Installation
1. Download and extract the script to your FiveM resources folder.
2. Ensure you have [ox_lib](https://github.com/overextended/ox_lib) installed.
3. Add `ensure ox_jail` to your `server.cfg`.

## Usage
- Type `/jail` in chat.
- Enter the password (`MET123`).
- Input the target player ID, jail time (in minutes), and reason.

## Configuration
- Change the password in `client.lua` (line 12).
- Modify the jail location in `client.lua` (`jailLocation` variable).

## License
MIT License
