CheddarGetter Yii Demo
===========
A demo of the CheddarGetter API and PHP library as a simple service using the
[Yii framework](http://www.yiiframework.com/) and
[Vagrant](http://www.vagrantup.com/) with
[VirtualBox](https://www.virtualbox.org/)

## Setup

### Get Vagrant and VirtualBox

If you don't already use them, download
[Vagrant](http://www.vagrantup.com/downloads.html) and
[VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your OS.

### Get the Code

Clone the repo and `vagrant up`. Better yet, fork and clone if you're
planning to contribute or if there's even the most remote possibility that you
will contribute improvements to the project. **Pull requests welcome!**

In a terminal:

```bash
$ cd cheddargetter-yii-demo
$ vagrant up
```

That'll take a few minutes. Once complete, you'll have a virtualized
dev environment running. For the curious, here's a general overview of what
vagrant is doing (FYI):

* Creates a virtual machine via VirtualBox: an Ubuntu 14.04 basic install.
* Creates a forwarded port from your host machine to the guest vm (8023 to 80).
So, once provisioned, you can go to http://localhost:8023 to see the demo.
* Automatically install (via [Puppet](http://puppetlabs.com/)) all of the
software required to run the demo:
  * PHP
  * Composer
    * Yii Framework
    * CheddarGetter Client Library
  * Apache
  * MySQL

### Signup for a Free CheddarGetter Account

If you haven't done so already,
[signup for CheddarGetter](https://cheddargetter.com/signup). Create your
product account and complete the quick-start wizard. It only takes a few
minutes. If you have questions about how it works,
[CheddarGetter support](http://support.cheddargetter.com/disucussion/new) is
usually quick to respond.

Now have a coffee and relax.

Then, edit the main config file located in protected/config to pass your
CheddarGetter API information to the CG component. You should have an
array that looks something like:

```php
  'cheddar'=>array(
    'class'=>'CheddarGetterClient',
		'cgurl'=>'www.cheddargetter.com',
		'cgemail'=>'you@youremail.com',
		'cgpass'=>'hunter2',
		'cgapp'=>'APP_NAME',
	),
```
so we can make API calls to the proper account. You should also edit the db
credentials to properly point to your preferred database.

Finally, run the SQL in protected/modules/user/data/schema.*.sql through
your favorite SQL program so we can properly create and track users.

## Contributing

1. [Fork it](https://help.github.com/articles/fork-a-repo)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](https://help.github.com/articles/using-pull-requests)
