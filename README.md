Mutator
====

## Installation
use [cpanm](http://search.cpan.org/~miyagawa/App-cpanminus-1.7027/lib/App/cpanminus.pm) short for cpanminus to install.
Cpanminus is a modern package manager for perl.

```bash
$ cpanm git@github.com:etheleon/mutator.git
```

## Introduction
Mutator module can do several tasks 

### Convert from Phred+64 to phred+33 

```perl
my $fq_qualityString = <some string>;
#Create obj
my $fqStringObj = Mutator->new(qualityScore=>$fq_qualitystring, phredType=64);
#Convert from 64 to 33
$fqString->convertPhred;
```

### introducting mutations to fastQ files based on phred scores.


