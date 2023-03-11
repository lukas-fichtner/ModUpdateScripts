# ModUpdateTools for ArmA 3

This repository is intended to facilitate modupdates for ArmA3 Sync and custom ArmA 3 server-launchers.
This is a tool that has been hardcoded for one project at a time and made available on the respective download server.

**CAUTION!** This project has been discontinued and will not be further developed!

## Tasks

- update ArmA 3 Sync repo
- update hashlist for custom ArmA 3 server-launchers
- refresh cloudflare cache

## Why Cloudflare?
Most of the time, traffic in the data center is not free, and hosting multiple ArmA 3 mod repositories can easily add up to 20-40TB of traffic per month.
To reduce the costs, you can activate the "full cache" through Cloudflare Pagerules. Thus, traffic can be easily saved. For each mod update, however, you must not forget to delete this cache, otherwise the users receive partially outdated data and the sync fails.
## Credits
**A special thanks goes to [Kaibu](https://github.com/kaibu) who shared his knowledge for this implementation.**

## License

The ModUpdateTools is licensed under the [GNU General Public License version 3](https://opensource.org/licenses/GPL-3.0)