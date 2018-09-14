. /vagrant_config/install.env

echo "******************************************************************************"
echo "Do grid software-only installation." `date`
echo "******************************************************************************"
${GRID_HOME}/gridSetup.sh -ignorePrereq -waitforcompletion -silent \
        -responseFile ${GRID_HOME}/install/response/gridsetup.rsp \
        INVENTORY_LOCATION=${ORA_INVENTORY} \
        SELECTED_LANGUAGES=${ORA_LANGUAGES} \
        oracle.install.option=CRS_CONFIG \
        ORACLE_BASE=${ORACLE_BASE} \
        oracle.install.asm.OSDBA=dba \
        oracle.install.asm.OSASM=dba \
        oracle.install.crs.config.scanType=LOCAL_SCAN \
        oracle.install.crs.config.gpnp.scanName=${SCAN_NAME} \
        oracle.install.crs.config.gpnp.scanPort=${SCAN_PORT} \
        oracle.install.crs.config.ClusterConfiguration=STANDALONE \
        oracle.install.crs.config.configureAsExtendedCluster=false \
        oracle.install.crs.config.clusterName=${CLUSTER_NAME} \
        oracle.install.crs.config.gpnp.configureGNS=false \
        oracle.install.crs.config.autoConfigureClusterNodeVIP=false \
        oracle.install.crs.config.clusterNodes=${NODE1_FQ_HOSTNAME}:${NODE1_FQ_VIPNAME}:HUB,${NODE2_FQ_HOSTNAME}:${NODE2_FQ_VIPNAME}:HUB \
        oracle.install.crs.config.networkInterfaceList=eth1:${PUBLIC_SUBNET}:1,eth2:${PRIVATE_SUBNET}:5 \
        oracle.install.asm.configureGIMRDataDG=false \
        oracle.install.crs.config.useIPMI=false \
        oracle.install.asm.storageOption=ASM \
        oracle.install.asmOnNAS.configureGIMRDataDG=false \
        oracle.install.asm.SYSASMPassword=${SYS_PASSWORD} \
        oracle.install.asm.diskGroup.name=DATA \
        oracle.install.asm.diskGroup.redundancy=EXTERNAL \
        oracle.install.asm.diskGroup.AUSize=4 \
        oracle.install.asm.diskGroup.disksWithFailureGroupNames=/dev/oracleasm/asm-disk1,,/dev/oracleasm/asm-disk2,,/dev/oracleasm/asm-disk3,,/dev/oracleasm/asm-disk4, \
        oracle.install.asm.diskGroup.disks=/dev/oracleasm/asm-disk1,/dev/oracleasm/asm-disk2,/dev/oracleasm/asm-disk3,/dev/oracleasm/asm-disk4 \
        oracle.install.asm.diskGroup.diskDiscoveryString=/dev/oracleasm/* \
        oracle.install.asm.gimrDG.AUSize=1 \
        oracle.install.asm.configureAFD=false \
        oracle.install.asm.monitorPassword=${SYS_PASSWORD} \
        oracle.install.crs.configureRHPS=false \
        oracle.install.crs.config.ignoreDownNodes=false \
        oracle.install.config.managementOption=NONE \
        oracle.install.config.omsPort=0 \
        oracle.install.crs.rootconfig.executeRootScript=false
