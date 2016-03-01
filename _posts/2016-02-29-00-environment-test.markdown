---
layout: post
title:  "Testing Your Environment"
number: 0
---
Before we start hacking away in the sqlite console, we need to make sure everyone has a working environment

# Launch Terminal
We're going to be doing a lot in the terminal for the interactive portions, which can be tricky. We won't have a lot of time to cover the terminal itself, but shout if you get lost and I'll swing by to help you out.
First, find the Terminal app in spotlight like so:

![Finder Terminal]({{ site.baseurl }}/assets/00/spotlight-terminal.png)

You should then be looking at a window that looks something like this:

![Terminal Blank]({{ site.baseurl }}/assets/00/terminal-blank.png)

# Navigate to the Mammoth School Project Directory
For the interactive portions, we're going to be using some scripts pre-packaged in this repository. To run those scripts, we have to navigate your terminal into the right directory. The scripts we'll be running are under the repository `sql/` folder.

The command to change directories is called `cd` for "change directory". By default terminal opens in your "home" folder (shown as "~") and so we're navigating from there. Since my copy of the repository is on my Desktop, I'll have to navigate by typing:

{% highlight bash %}
$ cd Desktop/mammoth-school-sql-intro/sql
{% endhighlight %}

You should now see something like this:

![Terminal SQL Path]({{ site.baseurl }}/assets/00/terminal-cd-sql.png)


# Run the Environment Test Script
Finally, we're going to try running the environment test script to verify everyones machine has a working version of sqlite. To do this, I've put together a script that runs some basic operations to verify basic functionality. Run this script by entering the following command:

{% highlight bash %}
$ sqlite3 < 00-environment-test.sql
{% endhighlight %}

The output should look something like below. If not, let's figure out why before proceeding.

![Terminal Test Ok]({{ site.baseurl }}/assets/00/terminal-test-ok.png)
