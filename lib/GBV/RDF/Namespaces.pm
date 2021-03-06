use strict;
use warnings;
package GBV::RDF::Namespaces;
# ABSTRACT: Defines common URI namespaces for GBV applications

use RDF::Trine::NamespaceMap;
use RDF::Trine::Namespace;
use Exporter qw();
use Carp 'croak';

our @ISA = qw(Exporter);

# please consult http://prefix.cc before adding a prefix
our $NS = RDF::Trine::NamespaceMap->new({
   bibo    => 'http://purl.org/ontology/bibo/',
   cdtype  => 'http://purl.org/cld/cdtype/',
   daia    => 'http://purl.org/ontology/daia/',
   daiaservice => 'http://purl.org/ontology/daia/Service/',
   dc      => 'http://purl.org/dc/elements/1.1/',
   dcterms => 'http://purl.org/dc/terms/',
   fabio   => 'http://purl.org/spar/fabio/',
   foaf    => 'http://xmlns.com/foaf/0.1/',
   frbr    => 'http://purl.org/vocab/frbr/core#',
   gbv     => 'http://purl.org/ontology/gbv/',
   geo     => 'http://www.w3.org/2003/01/geo/wgs84_pos#',
   hcterms => 'http://purl.org/uF/hCard/terms/',
   owl     => 'http://www.w3.org/2002/07/owl#',
   rdamedia   => 'http://rdvocab.info/termList/RDAMediaType/',
   rdacarrier => 'http://rdvocab.info/termList/RDACarrierType/',
   rdacontent => 'http://rdvocab.info/termList/RDAContentType/',
   rdf     => 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
   rdfs    => 'http://www.w3.org/2000/01/rdf-schema#',
   skos    => 'http://www.w3.org/2004/02/skos/core#',
   vcard   => 'http://www.w3.org/2006/vcard/ns#',
   void    => 'http://rdfs.org/ns/void#',
   xsd     => 'http://www.w3.org/2001/XMLSchema#',
});

use Data::Dumper;

sub import {
    my ($pkg,$name) = @_;
    return unless $name;

    if ( $name =~ /^[0-9]/ ) {
        Exporter::require_version( $pkg, $name );
        $name = $_[2];
        return unless $name;
    }

    my $callpkg = caller;
    croak 'your package name looks invalid' if $callpkg !~ /\A\w+(::\w+)*\z/;

    if ( $name =~ /^\$([a-z_][a-z_0-9]*)$/i ) {
        no strict 'refs';
        no warnings 'once';
        $name = $1;
        ${ $callpkg . "::" . $name } = $NS;
    } else {
        croak "Invalid name $name\n";
    }
}

1;

=head1 DESCRIPTION

This module defines a L<RDF::Trine::NamespaceMap> with predefined URI 
namespaces for GBV applications. The NamespaceMap is defined as
$GBV::RDF::Namespaces::NS, but you can export a reference to it in
the caller's namespace.

=head2 SYNOPSIS

    use GBV::RDF::Namespaces;
    my $ns = $GBV::RDF::Namespaces::NS;

    # or

    our $ns;
    use GBV::RDF::Namespaces qw($ns);

    $uri = $ns->frbr('item');   # returns a RDF::Trine::Resource
    $uri = $ns->uri('gbv:iln'); # returns a RDF::Trine::Resource

    print $uri->uri_value;      # stringify the URI value

    # you can also check the module's version on import
    use GBV::RDF::Namespaces qw(0.1 $ns);

=head2 SEE ALSO

See L<RDF::Trine::Resource> and the other L<RDF::Trine> modules.

=cut
