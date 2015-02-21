use inc::Module::Install;

# Define metadata
name            'Mutator';
all_from        'lib/Mutator.pm';
author          'Wesley GOI <picy2k@gmail.com>';
perl_version    '5.18';
# Specific dependencies
requires       'Moo'  => '1.007000';
requires       'namespace::clean'  => '0.25';
requires        'autodie' => '2.23';
  #test_requires  'Test::More'  => '0.42';
  #recommends     'Text::CSV_XS'=> '0.50';
  #no_index       'directory'   => 'demos';
  #install_script 'myscript';

WriteAll;
