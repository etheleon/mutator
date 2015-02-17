Mutator
====

## Introduction
Mutator module can do several tasks 

### Convert from Phred+64 to phred+33 

```perl
$fq_qualityString = <some string>;
my $fqStringObj = Mutator->new(qualityScore=>$fq_qualitystring, phredType=64);
#Convert from 64 to 33
$fqString->convertPhred;
```

### introducting mutations to fastQ files based on phred scores.


