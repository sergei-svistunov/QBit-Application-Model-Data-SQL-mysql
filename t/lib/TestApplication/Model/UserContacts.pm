package TestApplication::Model::UserContacts;

use qbit;

use base qw(QBit::Application::Model::Data::SQL::mysql);

sub _fields_ {
    return (
        id    => {type => 'int', caption => 'User ID'},
        phone => {type => 'varchar',   length  => 10, caption => d_gettext('Phone')},
        fax   => {type => 'varchar',   length  => 10, caption => d_gettext('Fax')},
    );
}

sub _pk_ {'id'}

my @DATA = (
    {id => 1, phone => '+0 111-11-11', fax => '+0 211-11-11'},
    {id => 2, phone => '+0 111-11-12', fax => '+0 211-11-12'},
    {id => 3, phone => '+0 111-11-13', fax => '+0 211-11-13'},
    {id => 4, phone => '+0 111-11-14', fax => '+0 211-11-14'},
    {id => 5, phone => '+0 111-11-15', fax => '+0 211-11-15'},
);

sub _get_data {
    my ($self, $fields, %opts) = @_;

    return map {+{hash_transform($_, [keys(%$fields)])}}
      grep {exists($opts{'filter'}) && $opts{'filter'}->eval($_) || !exists($opts{'filter'})} @DATA;
}

TRUE;
