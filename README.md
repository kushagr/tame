# A Golden Crown

## Problem
There is no ruler in the universe of Southeros and pandemonium reigns. Shan, the gorilla king of the Space kingdom
wants to rule all Six Kingdoms in the universe of Southeros. He needs the support of 3 more kingdoms to be the ruler.

Each kingdom has an animal emblem and Shan needs to send a message with the animal in the message to win them over.
SPACE emblem - Gorilla, LAND emblem - Panda, WATER emblem - Octopus,
ICE emblem - Mammoth, AIR emblem - Owl, FIRE emblem - Dragon.

Once he wins 3 more kingdoms, he is the ruler! The secret message needs to contain the letters of the animal in their emblem.
For example, secret message to the Land kingdom (emblem: Panda) needs to have the letter 'p','n','d' at-least once and 'a' atleast twice. If he sends "ahdvvnxxxautup" to the Land kingdom, he will win them over.
King Shan wants to make sure his secret message is not found by his enemies easily. So he decides to use the oldest of the
ciphers 'Seasar cipher’. A cipher is a type of secret code, where you swap the letters around so that no-one can read your
message. 
To make the secret message encrypted, King Shan uses a secret key, which is the number of characters in the emblem.
If King Shan wants to send a message to kingdom Air, he uses the number 3 as the cipher key, as emblem ‘owl’ has 3
characters. So, to encrypt the letter ‘a’, just move 3 letters clockwise on the message wheel, which will give the letter ‘d'.

So if King Shan, sends the message "rozo" to Air, King Shan will receive
the allegiance from Air. As "rozo" will decrypt to "olwl" and these letters
contain the emblem characters ‘o’, ’w’, ’l’. 

If King Shan wants to send a message to kingdom Land, he uses the
number 5 as the cipher key, as emblem ‘panda’ has 5 characters. To
encrypt the letter ‘a’, just move 5 letters clockwise on the message
wheel, which will give you the letter ‘f’.

Sample Input can be found under spec/fixtures.

We do not support Windows at this point in time. If you don't have access to an OSX or Linux machine, we recommend setting up a Linux machine you can develop against using something like [VirtualBox](https://www.virtualbox.org/) or [Docker](https://docs.docker.com/docker-for-windows/#test-your-installation).

This needs [Ruby to be installed](https://www.ruby-lang.org/en/documentation/installation/), followed by some libraries. The steps are listed below.

## Setup

First, install [Ruby](https://www.ruby-lang.org/en/documentation/installation/). Then run the following commands under the `tame_of_thrones` dir.

```
tame_of_thrones $ ruby -v # confirm Ruby present
ruby 2.6.5p57 (2018-03-29 revision 63029) [x86_64-darwin17]
tame_of_thrones $ gem install bundler # install bundler to manage dependencies
Successfully installed bundler-1.16.1
Parsing documentation for bundler-1.16.1
Done installing documentation for bundler after 2 seconds
1 gem installed
tame_of_thrones $ bundle install # install dependencies
...
...
Bundle complete! 3 Gemfile dependencies, 3 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
tame_of_thrones $ 

```

## Usage

You can run the application from `tame_of_thrones` by doing
```
tame_of_thrones $ rake default ./spec/fixtures/success_input.txt
```

You can run the full suite directly from `tame_of_thrones` by doing
```
tame_of_thrones $ bundle exec rspec spec
```
