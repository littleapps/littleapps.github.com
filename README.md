littleapps.jp
=============

Corporate site

[日本語] / [English]

Build & Dependency Status
-------------------------

[![Build Status](https://travis-ci.org/littleapps/littleapps.github.io.png?branch=source)](https://travis-ci.org/littleapps/littleapps.github.io)

[![Dependency Status](https://gemnasium.com/littleapps/littleapps.github.io.svg)](https://gemnasium.com/littleapps/littleapps.github.io)

Build
-----

```bash
bundle exec middleman build
```

Preview
-------

```bash
bundle exec middleman server
```

Deploy
------

Export GitHub [OAuth Token] to .env.

```
echo "GH_TOKEN=<MY_GITHUB_TOKEN>" > .env
```

```bash
bundle exec middleman deploy
```

License
-------

Copyright (C) 2014 [Atsushi Nagase].

All rights reserved with all articles and pictures.

Everything else in [the repository][repo] is MIT licensed.

See [LICENSE.md] for details.

[日本語]: http://littleapps.jp/ja/
[English]: http://littleapps.jp/
[Atsushi Nagase]: http://ngs.io/
[repo]: https://github.com/littleapps/littleapps.github.io/
[OAuth Token]: https://github.com/settings/tokens/new
[LICENSE.md]: https://github.com/littleapps/littleapps.github.io/blob/source/LICENSE.md
