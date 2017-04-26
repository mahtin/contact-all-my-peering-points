:

tmp=/tmp/p$$
trap "rm -f ${tmp}_*; exit" 0 1 2 15

NAME="$1"

./get-org.sh "${NAME}" | tee ${tmp}_org | jq '.data[]|.net_set[]' | while read net
do

	echo "Net: ${net}"

	./get-net.sh ${net} | tee ${tmp}_net | jq -c '.data[]|.name,.asn,.poc_set,.netixlan_set' > ${tmp}_1
	name=`sed -n -e 1p < ${tmp}_1`
	asn=`sed -n -e 2p < ${tmp}_1`
	poc_set=`sed -n -e 3p < ${tmp}_1`
	netixlan_set=`sed -n -e 4p < ${tmp}_1`

	echo "Name: ${name}" 2>&1
	echo "ASN: AS${asn}" 2>&1
	echo "POCs: ${poc_set}" 2>&1
	echo "IX LANs: ${netixlan_set}" 2>&1

	echo "${poc_set}" | jq '.[]' | while read poc
	do
		./get-poc.sh ${poc} | tee ${tmp}_poc | jq '.data[]|.email' > ${tmp}_2

		email=`sed -n -e 1p < ${tmp}_2`

		echo "Network E-mail: ${email}" 2>&1
	done

	echo -n > ${tmp}_6

	echo "${netixlan_set}" | jq '.[]' | while read ixlan
	do
		./get-netixlan.sh ${ixlan} | tee ${tmp}_ixlan | jq '.data[]|.ix_id' > ${tmp}_3
		ix=`sed -n -e 1p < ${tmp}_3`

		echo -n > ${tmp}_5
		./get-ix.sh ${ix} | tee ${tmp}_ix | jq -c '.data[]|.name,.long_name,.city,.tech_email,.policy_email' > ${tmp}_4
		ix_name=`sed -n -e 1p < ${tmp}_4`
		ix_longname=`sed -n -e 2p < ${tmp}_4`
		ix_city=`sed -n -e 3p < ${tmp}_4`
		ix_tech_email=`sed -n -e 4p < ${tmp}_4`
		ix_policy_email=`sed -n -e 5p < ${tmp}_4`
		echo $ix_tech_email >> ${tmp}_5
		echo  $ix_policy_email >> ${tmp}_5
		sort -u < ${tmp}_5 >> ${tmp}_6

		echo "IX: $ixlan, $ix, $ix_name, $ix_longname, $ix_city, $ix_tech_email, $ix_policy_email" 2>&1
	done

	sort -t'@' -k2,3 < ${tmp}_6 | uniq > ${tmp}_7

	echo "SEND EMAIL TO THE FOLLOWING:"
	sed -e 's/"//g' -e '/^$/d' -e 's/^/	/' < ${tmp}_7

	echo ""
done

exit 0
