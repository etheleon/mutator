#!/usr/bin/env perl

use strict;
use v5.18;
use autodie;
use Mutator;

my $qualityScore = q|_^_ccccc^^ec^beb_fdcea_g_ddffebd_^^ca[`faaffU_WZcV\`]Xb\`ddY\_^][FZaYbbab__YY_TY_`R^`[`b`]bb`abb[_]b`R]|;
my $qual = Mutator->new(qualityScore => $qualityScore, phredType=>64);

say "###Original score";
say $qual->qualityScore;
say "\n----\n";
say "#Converted score";
$qual->convertPhred;
say $qual->qualityScore;
#say $qual->giveScore;
