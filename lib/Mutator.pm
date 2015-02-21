package Mutator;
use autodie;
use Moo;
use namespace::clean;
use v5.18;

has ntFreq => (
is => 'ro',
default => sub {
    [0.25, 0.50,0.75,1];
},
isa => sub { die "$_[0] is not a frequency table" unless scalar @{$_[0]} == 4}
);

has indel => (
    is      => 'ro',
    default => sub { 0.01 },
    isa     => sub {die "$_[0] is not indel rate" unless $_[0] < 1 && $_[0] > 0}
);

has ntSequence => (
    is  => 'rw',
    isa => sub {die "$_[0] is not NT sequence" unless $_[0] =~ /[ATCGNatcgn]/}
);

has qualityScore => (
  is  => 'rw',
  isa => sub {die "$_[0] is not a quality score string" unless $_[0] =~ /[[:ascii:]]/}
);

has phredType => (
  is   => 'ro',
  lazy => 1,
  isa  => sub {unless($_[0] == 33 || $_[0] == 64){ die "$_[0] is not a valid phred type" }}
);

sub convertPhred {
  my $self = shift;
  if($self->phredType == 64)
  {
  $self->qualityScore(join '', map {chr($_)} map { ord($_) - 31 } split('', $self->qualityScore));
  }
}

sub giveScore {
    my $self = shift;
    return map { 10**($_/(-10)) } map { ord($_) - 33} split('', $self->qualityScore);
}

sub mutate{
    my $self   = shift;
    my @qual   = $self->giveScore;
    my @readnt = split '', $self->ntSequence;
    #say "qual:\t", scalar @qual, "nt:\t", scalar @readnt;
    my @newSequence;
    while(scalar @qual > 0)
    {
        my $qualityscore = shift @qual;
        my $currentNT = shift @readnt;
        push @newSequence, rand()<$qualityscore ? $self->rand_nt : $currentNT;
    }
    return join '', @newSequence;
}

sub rand_nt
{
    my $self = shift;
    my $rand = rand;
    my $freq = $self->ntFreq;
    return 'a' if ($rand<$freq->[0]);
    return 't' if ($rand<$freq->[0]+$freq->[1]);
    return 'g' if ($rand<$freq->[0]+$freq->[1]+$freq->[2]);
    return 't' if ($rand<$freq->[0]+$freq->[1]+$freq->[2]+$freq->[3]);
    return 'n';
}

1;
