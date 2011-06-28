use strict;
use Test::More;

require GBV::RDF::Namespaces;

eval {
    GBV::RDF::Namespaces->import('99.9');
};
like $@, qr{^GBV::RDF::Namespaces version 99\.9 required}, 'import new version';

eval {
    GBV::RDF::Namespaces->import('$--');
};
like $@, qr{^Invalid name}, 'import with invalid name';

eval {
    GBV::RDF::Namespaces->import('0.1', '$foo');
};
ok !$@, 'import this version with valid name';
{ 
    no strict;
    no warnings;
    is $foo, $GBV::RDF::Namespaces::NS, 'exported as $foo'; 
};

done_testing;
