# contact-all-my-peering-points

# Requirements

You need the jq command (along with curl). Download it from https://stedolan.github.io/jq/ and install as described.

## Basic usage

```
$ ./do-it-all.sh "network name"
```

Where network name is your network name from PeeringDB.

## Example

```
$ ./do-it-all.sh 'Liquid Telecommunications'
Net: 725
Name: "Liquid Telecommunications"
ASN: AS30844
POCs: [1334,11090,18053]
IX LANs: [8851,11116,14181,15827,19555,20427,21414,24831,25796,26577,33534]
Network E-mail: 
Network E-mail: 
Network E-mail: 
IX: 8851, 18, "LINX LON1", null, "London", "support@linx.net", "info@linx.net"
IX: 11116, 321, "LINX LON2", null, "London", "support@linx.net", "info@linx.net"
IX: 14181, 129, "JINX", null, "Johannesburg", "ops@inx.net.za", "info@inx.net.za"
IX: 15827, 592, "NAPAfrica IX Johannesburg", null, "Johannesburg", "andrew@teraco.co.za", "michele@teraco.co.za"
IX: 19555, 26, "AMS-IX", null, "Amsterdam", "noc@ams-ix.net", "info@ams-ix.net"
IX: 20427, 31, "DE-CIX Frankfurt", null, "Frankfurt", "support@de-cix.net", "sales@de-cix.net"
IX: 21414, 866, "SH-IX", null, "Fujairah, UAE", "noc@emix.ne.ae", "moyahiya@etisalat.ae"
IX: 24831, 361, "TIX - Tanzania", null, "Dar es Salaam", "info@tix.or.tz", "info@tix.or.tz"
IX: 25796, 236, "KIXP", null, "Nairobi", "", ""
IX: 26577, 344, "CINX", null, "Cape Town", "ops@inx.net.za", "info@inx.net.za"
IX: 33534, 597, "NAPAfrica IX Cape Town", null, "Cape Town", "andrew@teraco.co.za", "michele@teraco.co.za"
SEND EMAIL TO THE FOLLOWING:
	
	info@ams-ix.net
	noc@ams-ix.net
	sales@de-cix.net
	support@de-cix.net
	noc@emix.ne.ae
	moyahiya@etisalat.ae
	info@inx.net.za
	ops@inx.net.za
	info@linx.net
	support@linx.net
	andrew@teraco.co.za
	michele@teraco.co.za
	info@tix.or.tz

$
```

