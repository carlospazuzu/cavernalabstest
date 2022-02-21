# Caverna Labs Internship Test

![](https://i.imgur.com/7YIGKDF.png)
This is the 2022 [Caverna Labs](https://www.cavernalabs.com.br/) internship test. A credit card number validator written in Ruby on Rails framework.

## Setup

First of all run **bundle install** to setup gems
```sh
bundle install
```
After that, you need build **database**, so run
```sh
rails db:migrate
```
Now we need to setup **webpack**
```sh
rails webpacker:install
```
After that, you are free to run the application, so run:
```sh
rails server
```

## Testing
Unit tests were written in order to test the credit card verification services which are implemented in the path `lib/services/`. You can run test with the following command:
```sh
rspec
```

## Using the application
On the top of the application, there is a file input button, whose you can upload text files in the following format:
```
4
6049900092305396
9735-8951-3054-3957
4444-6626-2290-2270
5786629933761616
```

- First line is the amount of test cases
- The following `n` lines are the credit card numbers for the application to verify

After selecting the proper `txt file` , click `save` button and the results will be shown. The application exhibit in a table results with the card numbers, the result if it is valid or invalid and an explanation why it is not valid, if it is the case.

Expected results for the above input:

| Credit Card                |Is Valid?                          |Explanation                         |
|----------------|-------------------------------|-----------------------------|
|6049900092305396|`Valid`            |            |
|9735-8951-3054-3957|`Invalid`            |_Does not start with 4, 5 or 6_            |
|4444-6626-2290-2270|`Invalid`            |_Has 4 or more consecutive repeated digits_            |
|5786629933761616|`Valid`            |            |

You can delete all entries by clicking the `Delete All` button.
You can see the same result in plain text by clicking the button `See result as plain text`.
