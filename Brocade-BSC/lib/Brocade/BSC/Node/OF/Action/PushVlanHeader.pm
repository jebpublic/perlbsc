=head1 Brocade::BSC::Node::OF::Action::PushVlanHeader

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2015,  BROCADE COMMUNICATIONS SYSTEMS, INC

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
contributors may be used to endorse or promote products derived from this
software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
THE POSSIBILITY OF SUCH DAMAGE.

=cut

package Brocade::BSC::Node::OF::Action::PushVlanHeader;
use parent qw(Brocade::BSC::Node::OF::Action);

use strict;
use warnings;


# Constructor ==========================================================
# Parameters: none
# Returns   : Brocade::BSC::Node::OF::Action::PushVlanHeader object
# 
sub new {
    my ($class, %params) = @_;

    my $self = $class->SUPER::new(%params);
    $self->{push_vlan_action}->{ethernet_type} = $params{eth_type};
    $self->{push_vlan_action}->{tag}           = $params{tag};
    $self->{push_vlan_action}->{pcp}           = $params{pcp};
    $self->{push_vlan_action}->{cfi}           = $params{cfi};
    $self->{push_vlan_action}->{vlan_id}       = $params{vid};
    bless ($self, $class);
    if ($params{href}) {
        while (my ($key, $value) = each %{$params{href}}) {
            $key =~ s/-/_/g;
            $self->{push_vlan_action}->{$key} = $value;
        }
    }
    return $self;
}


# Method ===============================================================
#             as_oxm
# Parameters: none
# Returns   : this, as formatted for transmission to controller
#
sub as_oxm {
    my $self = shift;

    return sprintf("push_vlan=0x%x", $self->eth_type());
}


# Method ===============================================================
#             accessors
sub eth_type {
    my ($self, $eth_type) = @_;
    $self->{push_vlan_action}->{ethernet_type} =
        (2 == @_) ? $eth_type : $self->{push_vlan_action}->{ethernet_type};
}
sub tag {
    my ($self, $tag) = @_;
    $self->{push_vlan_action}->{tag} =
        (2 == @_) ? $tag : $self->{push_vlan_action}->{tag};
}
sub pcp {
    my ($self, $pcp) = @_;
    $self->{push_vlan_action}->{pcp} =
        (2 == @_) ? $pcp : $self->{push_vlan_action}->{pcp};
}
sub cfi {
    my ($self, $cfi) = @_;
    $self->{push_vlan_action}->{cfi} =
        (2 == @_) ? $cfi : $self->{push_vlan_action}->{cfi};
}
sub vid {
    my ($self, $vid) = @_;
    $self->{push_vlan_action}->{vlan_id} =
        (2 == @_) ? $vid : $self->{push_vlan_action}->{vlan_id};
}


# Module ===============================================================
1;