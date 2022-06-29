Smart Pension Ruby Test 

Smart Pension App is a smart log parser, which display the most and unique page visit or any of the mentioned using command line arguments using `ruby 2.6.3`.  

Run the program using following
```
./bin/parser.rb webserver.log 
```
or
```
./bin/parser.rb webserver.log --mode=all
```

This will by default count most and unique number of visits. 
For unique only
```
./bin/parser.rb webserver.log --mode=unique
```
For most only
```
./bin/parser.rb webserver.log --mode=most
```
To get output in descending order.
```
./bin/parser.rb webserver.log --sorter=descending
```
For help menu
```
./bin/parser.rb -help
```


To set up the app use,
```
bundle install
```

For RSpec test cases
```
bunlde exec rspec
```
