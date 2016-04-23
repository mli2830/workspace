start:	
	$(MAKE) makestuff

######################################################################
# Cloning

repo = https://github.com
ms = makestuff/

%.dir:
	mkdir $*
	$(MAKE) %.files

%.files:
	$(MAKE) $*/stuff.mk
	$(MAKE) $*/Makefile
	$(MAKE) $*/local.mk

clone:
	git clone $(repo)/$(user)/$(target).git
	$(MAKE) $(target)/stuff.mk
	$(MAKE) $(target)/Makefile
#	$(MAKE) $(target).newpush

ssh_set:
	cd $(name) && git remote set-url origin $(repo):$(user)/$(name).git

dushoff_github = techtex-ebola sherif makestuff TZ_clinics Latent_incidence_fitting

$(dushoff_github):
	$(MAKE) target=$@ user=dushoff clone

Bio3SS = 3SS

$(Bio3SS):
	$(MAKE) target=$@ user=Bio3SS clone

$(Bio3SS:%=%.ssh): %.ssh:
	$(MAKE) name=$* user=Bio3SS ssh_set

mac-theobio = DHS_pipeline

$(mac-theobio):
	$(MAKE) target=$@ user=mac-theobio clone

$(mac-theobio:%=%.ssh): %.ssh:
	$(MAKE) name=$* user=mac-theobio ssh_set


Outbreak-analysis = OA_workspace

$(Outbreak-analysis):
	$(MAKE) target=$@ user=Outbreak-analysis clone

$(Outbreak-analysis:%=%.ssh): %.ssh:
	$(MAKE) name=$* user=Outbreak-analysis ssh_set

mli_github = Survival mylife lunchbox rdc mikenimble cancer_survival nimble_test HLPM Li_Rabies mli_sims HIV_Coupling
$(mli_github):
	$(MAKE) target=$@ user=wzmli clone

bolker_github = cpcbp hmm_temphet bbmisc mixedmodels-misc math1mp
$(bolker_github):
	$(MAKE) target=$@ user=bbolker clone

fishforwish = fgc
$(fishforwish):
	$(MAKE) target=$@ user=fishforwish clone
	
	
	
-include rmk.mk
