# PhoneNumberMapper

## Usage

Use ruby >= 2.4.0

Setup:

```
bundle install
bin/setup
```

Execution Benchmark:

```
$ bin/console
2.4.0 :001 > require 'benchmark'
 => true
2.4.0 :002 > puts Benchmark.measure { PhoneNumberMapper::NumberToWord.new(2282668687).words }
  0.320000   0.010000   0.330000 (  0.330164)
```

Example:

```
$ bin/console
2.4.0 :001 > PhoneNumberMapper::NumberToWord.new(2282668687).words
 => [["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], "catamounts", ["cat", "contour"], ["acta", "mounts"]]
2.4.0 :002 > PhoneNumberMapper::NumberToWord.new(6686787825).words
 => [["noun", "struck"], ["onto", "struck"], "motortruck", ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"]]
 ```

Rspec Execution Report:

```
$ rspec spec --format documentation

PhoneNumberMapper::NumberToWord
  Validations
    #number
      Should not accept 123
      Should not accept nil
      Should not accept string
      Should accept 6686787825
  Instance Methods
    #words
      Validate result for 6686787825
      Validate result for 2282668687
      Should execute within 1000 ms

PhoneNumberMapper
  has a version number

Finished in 2.66 seconds (files took 0.38977 seconds to load)
8 examples, 0 failures
```

## Development

Use console to execute commands, start console using `bin/console`
