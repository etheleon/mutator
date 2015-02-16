package Mutator;
use Moo;
use namespace::clean;

has qualityScore => (
  is => 'rw',
  isa => sub {die "$_[0] is not a quality score string" unless $_[0] =~ /[[:ascii:]]/}
);

has phredType => (
  is => 'ro',
  isa => sub {unless($_[0] == 33 || $_[0] == 64){ die "$_[0] is not a valid phred type" }}
);


sub convertPhred {
  my $self = shift;
  $self->qualityScore(join '', map { ord($_) - $self->phredType } split('', $self->qualityScore));
}
sub giveScore{
    my $self = shift;
    return join '', map {10**($_/(-10)) } split('', $self->qualityScore);
}

1;
