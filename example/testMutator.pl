#!/usr/bin/env perl

use strict;
use v5.18;
use autodie;
use Mutator;

my $ntSequence   = q|TNGCTTCTTCTTCTTCTTCTTCTTCTACAGTTTTGATTTNNGTATCCTGAAGGAGGGAATTATCATTATGAGCAAGAGGAGTACGTGTAGCTTTCGAATGG|;
my $qualityScore = q|bBP`cceeggeceghdfhdghiiidgfffgifhhighhiBBPP^egfhiffgieghihhiibgffhhhhggggdebbceecdddccccccccccccaabc_|;

my $qual = Mutator->new(qualityScore => $qualityScore, phredType=>64, ntSequence=>$ntSequence);

say "#Original (phred+64)";
say "----";
say $qual->ntSequence;
say $qual->qualityScore;

say "\n#Convert quality to (phread+33)\n";

$qual->convertPhred;
say "\n#Mutated ";
say "----";
say $qual->mutate;
say $qual->qualityScore;
