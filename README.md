Starter kit for DrupalExtension
===============================

How to start
------------

Clone it:

    git clone git@github.com:tanarurkerem/dug20130926.git

Initialize:

    bash init.sh

If you would like to use Selenium test, start selenium:

    bash selenium.sh start

Set your base\_url in behat.yml (eg.: mysite.loc)

    sed -i -e 's/dug.loc/mysite.loc/g' behat.yml

Set your drupal\_root in behat.yml (eg.: ~/sites/mydrupal)

    sed -i -e 's!../www!~/sites/mydrupal!g' behat.yml

Use:

    Use :)

Some tips:
----------

Print all available step definitions:

    bin/behat -dl

Print \*.feature example:

    bin/behat --story-syntax

Run tests:

    bin/behat

Run one test(eg.: login.feature in your features directory):

    bin/behat features/login.feature

Use Selenium:
  Add @javascript tag to your Feature or Scenario

Usefull links:

* http://behat.org/
* https://drupal.org/project/drupalextension

Enjoy!
