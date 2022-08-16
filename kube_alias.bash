#KubeCmds
function installk3s() {
	curl -sfL https://get.k3s.io | sh -
}

function uninstallk3s() {
	k3s-uninstall.sh
}

function kdeldep() {
    kubectl get deployment --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl delete deployment $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdelsecret() {
    kubectl get secret --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl delete secret $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdelcert() {
    kubectl get certificate --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl delete certificate $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdelissuer() {
    kubectl get issuer --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl delete issuer $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdelp() {
    kubectl get pods --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl delete pod $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdelpa() {
    kubectl get pods --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl delete pod $(< /tmp/cmd) ; fi  && rm -f /tmp/cmd
}

function kdelpv() {
    kubectl get pv --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs kubectl delete pv
}

function kdelpvc() {
    kubectl get pvc --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl delete pvc $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdelcm() {
    kubectl get cm --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl delete cm $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdelrs() {
    kubectl get rs --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl delete rs $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function ke() {
    kubectl get pods --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&   \
    if [ -s /tmp/cmd ]; then \
    echo -n "Enter Command: " && read cmd &&  \
    kubectl exec -it $(< /tmp/cmd) -- $cmd ; fi && rm -f /tmp/cmd
}


function kl() {
    kubectl get pods --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&   \
    if [ -s /tmp/cmd ]; then \
    echo -n "Enter Arg: " && read arg &&  \
    kubectl logs $arg $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}


function kdesp() {
    kubectl get pods --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl describe pod $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdespv() {
	kubectl get pv --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs kubectl describe pv
}

function kdespvc() {
    kubectl get pvc --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl describe pvc $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdescm() {
    kubectl get cm --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl describe cm $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdesrs() {
    kubectl get rs --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&  \
    if [ -s /tmp/cmd ]; then \
    kubectl describe rs $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kedit() {
    echo -n "Enter what to be edited: " && read arg &&  \
    kubectl get $arg --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&   \
    if [ -s /tmp/cmd ]; then \
    kubectl edit $arg $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kl() {
    kubectl get pods --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&   \
    if [ -s /tmp/cmd ]; then \
    echo -n "Enter Arg: " && read arg &&  \
    kubectl logs $arg $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdes() {
    echo -n "Enter what to be described: " && read arg &&  \
    kubectl get $arg --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&   \
    if [ -s /tmp/cmd ]; then \
    kubectl describe $arg $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

function kdel() {
    echo -n "Enter what to be deleted: " && read arg &&  \
    kubectl get $arg --all-namespaces | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $2 " -n " $1 }' | \
    tee /tmp/cmd &&   \
    if [ -s /tmp/cmd ]; then \
    kubectl delete $arg $(< /tmp/cmd) ; fi && rm -f /tmp/cmd
}

alias kgpv="kubectl get pv"
alias kgpvc="kubectl get pvc"
alias kgns="kubectl get ns"
alias kgp="kubectl get pods"
alias kgpa="kubectl get pods --all-namespaces"
alias kgcm="kubectl get cm"
alias kgn="kubectl get nodes"
alias kgd="kubectl get deploy"
alias kgrs="kubectl get rs"
alias kgcert="kubectl get certificate"
alias kgissuer="kubectl get issuer"
alias kgsecret="kubectl get secret"

alias kci="kubectl cluster-info"
alias kc="kubectl create"
alias kd="kubectl delete"
alias kg="kubectl get"
alias ka="kubectl apply"
alias k="kubectl"

alias wkga="watch kubectl get all -o wide"

