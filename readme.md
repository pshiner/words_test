Overview:

Since we talked about testing frameworks I went ahead and started this
project as if I was building a standard CPAN module.  I made a module
`WordsTest` that implements the logic.  There is a simple test
routine in the `t` directory.  The `sample` directory has a hard coded
sample of how to use the module.  The `bin` directory has a tiny script
that reads it from standard input and outputs the two expected files:
`sequences` and `words`, though the module is fairly flexible.

Notes:

* The final result is in the `bin` directory. This includes a small script to use the module/library.
* The example program is in the `sample` directory.
* See CPAN documentation on using `Module::Build` ( http://search.cpan.org/~nplatonov/Module-Build-Functions-0.04/lib/Module/Build/Functions.pod )
* Also see http://bratislava.pm.org/en/tutorial/new-module.html for ideas.
* Also look at the `Test::More` module for how to use the testing framework.


Eclipse Users:
* Add `lib` to your project include path.
* You'll need a command window in Windows to run the test process and the command line will be something like: `perl.exe Build test` from the root directory.
