dockbfg-repo-cleaner
====================

Dockerized version of `BFG Repo Cleaner <https://rtyley.github.io/bfg-repo-cleaner/>`_: Removes large or troublesome blobs like git-filter-branch does, but faster.

.. |dockbfg-repo-cleaner| image:: https://images.microbadger.com/badges/image/jcfr/dockbfg-repo-cleaner.svg
  :target: https://microbadger.com/images/jcfr/dockbfg-repo-cleaner

jcfr/dockbfg-repo-cleaner
  |dockbfg-repo-cleaner| Dockerized version of BFG Repo Cleaner.


An alternative to git-filter-branch
-----------------------------------

*The following text was copied from the original website*

The BFG is a simpler, faster alternative to git-filter-branch for cleansing bad data out of your Git repository history:

* Removing **Crazy Big Files**
* Removing **Passwords**, **Credentials** & other **Private data**

The `git-filter-branch` command is enormously powerful and can do things that the BFG can't - but the BFG is much better for the tasks above, because:

* `Faster`_ : 10 - 720x faster
* `Simpler`_ : The BFG isn't particularily clever, but is focused on making the above tasks easy
* Beautiful : If you need to, you can use the beautiful Scala language to customise the BFG. Which has got to be better than Bash scripting at least some of the time.

.. _Faster: https://rtyley.github.io/bfg-repo-cleaner/#speed
.. _Simpler: https://rtyley.github.io/bfg-repo-cleaner/#examples


Installation
------------

This image does not need to be run manually. Instead, there is a helper script
to execute it.

To install the helper script, copy the script `bfg-repo-cleaner` in your `PATH`::

  curl https://raw.githubusercontent.com/jcfr/dockbfg-repo-cleaner/master/bfg-repo-cleaner.sh \
    -o ~/bin/bfg-repo-cleaner && \
  chmod +x ~/bin/bfg-repo-cleaner


Maintenance
-----------

To rebuild the image::

  git clone git://github.com/jcfr/dockbfg-repo-cleaner
  make build


To publish the image::

  docker login -u <user> -p <password>
  make push


License
-------

This project is licensed under Apache 2.0 license.

The `bfg-repo-cleaner` executable is licensed under GNU General Public License.


---

Credits go to `sdt/docker-raspberry-pi-cross-compiler <https://github.com/sdt/docker-raspberry-pi-cross-compiler>`_, who invented the base of the dockerized script.

