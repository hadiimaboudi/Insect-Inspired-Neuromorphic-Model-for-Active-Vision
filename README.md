# Neuromorphic Model of Active Vision
This repository contains the code and resources for implementing a neuromorphic, insect-inspired model of active vision, described in the elife paper “A neuromorphic model of active vision shows how spatiotemporal encoding in lobula neurons can aid pattern recognition in bees”. The work was led by HaDi MaBouDi and collaborators, exploring how scanning behaviors shape neural representations in the bee optic lobes 

This repo implements a bio-inspired spiking neural network with:

1- Photoreceptor → Lamina → Medulla → Lobula pathway simulating bee visual processing.

2- Non-associative STDP plasticity in medulla-to-lobula connections, modulated by scanning behavior.

3- Mushroom-body–style associative network for classification decisions.

4- Demonstrates emergence of orientation-selective lobula neurons and successful pattern recognition akin to behavioral experiments


The repository is organised into several key directories and files. The data/ folder contains training and testing images along with scan trajectory data used in simulations. Core model components are implemented in the src/ directory, including modules for photoreceptors (photoreceptor.py), lamina processing (lamina.py), medulla and lobula neurons (medulla_lobula.py), the mushroom body decision module (mushroom_body.py), synaptic plasticity (plasticity.py), and the main simulation script (simulate_scanner.py). Experimental configurations are stored in the experiments/ folder, which includes subdirectories for specific tasks such as plus_vs_times/ and spiral_cross_discrimination/. Model outputs are saved in the results/ directory, separated into receptive_fields/ and behavioral_performance/



% If you use or adapt this model in your work, please cite:
MaBouDi H., Roper M., Guiraud M.-G., Juusola M., Chittka L., Marshall J.A.R. 2025. 
A neuromorphic model of active vision shows how spatiotemporal encoding in lobula neurons can aid pattern recognition in bees. 
https://doi.org/10.7554/eLife.89929


