# xûrfinder
---
## let's find xûr

This is meant to be a personal project to get comfortable using programming languages other than C. I also want to get some experience working with online APIs. 

Run the following commands in order to download and run the script.
```sh
git clone https://github.com/georgedance/xurfinder
cd xurfinder
python src/xurfinder.py
```

Alternatively, you could use the [`Makefile`](/Makefile) to run the script. (This is just a convenience for myself out of habit.)
```sh
make run
```

You could also install the script into `/usr/local/bin/` with the [`Makefile`](/Makefile). You may need to run with `sudo` to get proper permissions.
```sh
sudo make install
```

If you ever want to uninstall it, just run this command from the [`Makefile`](/Makefile).
```sh
sudo make uninstall
```

