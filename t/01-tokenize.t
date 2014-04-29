#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Text::Tokenize::Indented;
use Data::Dumper;

plan tests => 11;

my $t = Text::Tokenize::Indented->tokenize (<<EOF);
this is a test.
this is only a test.
   here are some indented lines.
   second one.
   
There was a blank.
         More indentation!
   Less indentation!
No indentation!

EOF

is_deeply ($t->(), [0, 'this is a test.']);
is_deeply ($t->(), [0, 'this is only a test.']);
is_deeply ($t->(), [3, 'here are some indented lines.']);
is_deeply ($t->(), [3, 'second one.']);
is_deeply ($t->(), [-1]);
is_deeply ($t->(), [0, 'There was a blank.']);
is_deeply ($t->(), [9, 'More indentation!']);
is_deeply ($t->(), [3, 'Less indentation!']);
is_deeply ($t->(), [0, 'No indentation!']);
ok (not defined $t->());
ok (not defined $t->());
