cdirs = makestuff Planning techtex-ebola sherif TZ_clinics zebra_movement diversity_metrics Country_lists Correspondence

push: $(cdirs:%=%.push)

pull: $(cdirs:%=%.pull)

sync: $(cdirs:%=%.sync)

######################################################################
# Cloning

# Correspondence has been moved here, but still has ghosts in ~/Dropbox/Work and on the wiki.

user = mli2830
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

dushoff_github = CIHR_Ebola Ebola_stochasticity make Planning rabies-SD RR autorefs dushoff.github.io makework techtex-ebola sherif makestuff TZ_clinics rabies_burden nserc_tools SEER_HPV initial_epi diversity_metrics Latent_incidence_fitting DHS_overview Country_lists little_r SIR_model_family Rabies_talks

$(dushoff_github):
	$(MAKE) target=$@ user=dushoff clone

Bio3SS = Bio3SS.github.io Bio3SS_content Population_time_series Lecture_images Exponential_figures

$(Bio3SS):
	$(MAKE) target=$@ user=Bio3SS clone

$(Bio3SS:%=%.ssh): %.ssh:
	$(MAKE) name=$* user=Bio3SS ssh_set

theobio_group = Serodiscordance_Champredon_2013 DHS_downloads Condom_awareness generation_interval_moments Disease_data

$(theobio_group):
	$(MAKE) target=$@ user=mac-theobio clone

mli_github = Survival mylife lunchbox rdc mikenimble cancer_survival 
$(mli_github):
	$(MAKE) target=$@ user=mli2830 clone

bolker_github = cpcbp hmm_temphet
$(bolker_github):
	$(MAKE) target=$@ user=bbolker clone

bellan_github = IDI-cumulative-VL-project
$(bellan_github):
	$(MAKE) target=$@ user=sbellan61 clone

fishforwish = fgc
$(fishforwish):
	$(MAKE) target=$@ user=fishforwish clone

######################################################################

# Syncing

%.push:
	cd $* && $(MAKE) push

%.pull: %
	cd $* && $(MAKE) pull

%.sync: %
	cd $* && $(MAKE) sync

%.testdir: %
	cd $* && $(MAKE) testdir

%/local.mk:
	touch $@
	-cp local/local.mk $@

%/stuff.mk:
	-cp $(ms)/stuff.mk $@

%/Makefile:
	echo "# $*" > $@
	cat $(ms)/hooks.mk >> $@
	cat $(ms)/makefile.mk >> $@
	cd $* && $(MAKE) Makefile

%.newpush:
	cd $* && $(MAKE) newpush
