#!/bin/bash
now=$(date "+%Y%d%m-%H%M");
mkdir "${now}_logs";
	for item in $(kubectl get pods | awk '{print $1}')
	                do
	                        if [[ ${item} = NAME ]] || [[ ${item} = *"cpro"* ]] || [[ ${item} = *"snmp-webhook"* ]] || [[ ${item} = *"reloader"* ]] || [[ ${item} = *"coap-adapter"* ]]
	                        then
	                            echo "Pod ${item} has multiply containers or there is some error or it may be filtered!"
	                        else
	                        	kubectl logs "${item}" > "${now}_logs/${item}.${now}.logs"
	                        fi
	                                
	done
tar -zcvf "logs-${now}.tar.gz" "${now}_logs"
echo
echo
echo "Done!"
echo
