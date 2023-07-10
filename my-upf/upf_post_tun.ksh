#!/bin/bash
#you need to change the lintf value which is interface name present in your system
lintf=net1
uintf=upf_tun0
ip_rule_v4()
{
        ruleInfo=$(ip rule show | awk ' /upf_tun0_table_rx/ || /upf_tun0_table_tx/ { printf "%s ", $5}')
        lflag=0
        uflag=0
        for inf in $ruleInfo
        do
                if [ $inf == $lintf ];then
                        lflag=1
                elif [ $inf == $uintf ];then
                        uflag=1
                fi
        done



        if [ $lflag -eq 0 ]
        then
                ip rule add iif $lintf lookup upf_tun0_table_rx
        fi



        if [ $uflag -eq 0 ]
        then
                ip rule add iif $uintf lookup upf_tun0_table_tx
        fi
}



ip_rule_v6()
{
        ruleInfo6=$(ip -6 rule show | awk ' /upf_tun0_table_rx/ || /upf_tun0_table_tx/ { printf "%s ", $5}')
        lflag6=0
        uflag6=0
        for inf6 in $ruleInfo6
        do
                if [ $inf6 == $lintf ];then
                        lflag6=1
                elif [ $inf6 == $uintf ];then
                        uflag6=1
                fi
        done



        if [ $lflag6 -eq 0 ];then
                ip -6 rule add iif $lintf lookup upf_tun0_table_rx
        fi



        if [ $uflag6 -eq 0 ];then
                ip -6 rule add iif $uintf lookup upf_tun0_table_tx
        fi
}



ip_rule_v4
ip_rule_v6
