### Matlab code I wrote for the detection of neurodegeneration by ex vivo and in vivo analysis of the fundus of the eye in human samples and non-human primates

### Diseases I worked on and performed computer vision analyses on patient samples: Parkinson's disease, frontotemporal dimentia, glaucoma, amyotrophic lateral sclerosis, transthyretin amyloidosis, and cerebral amyloid angiopathy

##### I developed a computational strategy for the differential diagnosis based on the imaging of the eye. The context of this project was the safe and convenient methods for differential diagnosis of various diseases and conditions associated with protein misfolding and aggregation. The computer visions strategy I outlined aimed at facilitating the differential diagnosis of patients having a disease or condition associated with protein aggregation and consisted of capturing fundus fluorescence (FF) images of the retina of a subject who has been administered a compound that emits fluorescence upon binding to a misfolded or aggregated protein, and analyzing the FF images with a machine learning algorithm to assign the subject to a cohort with a particular disease or condition. 

##### The list of the diseases is: Alzheimer’s disease, cerebral amyloid angiopathy, traumatic brain injury, glaucoma, age-related macular degeneration, Parkinson’s disease, multiple system atrophy, dementia with Lewy bodies, amyotrophic lateral sclerosis, Creutzfeldt-Jakob disease (CJD), which can be sporadic (sCJD), hereditary / familial (fCJD), iatrogenic (iCJD) or variant (vCJD), protease-sensitive prionopathy, Gerstmann-Sträussler-Scheinker disease, Kuru, or fatal insomnia. 

##### An artificial intelligence (AI) deep learning (DL) algorithm with a graphical user interface (GUI) can automatically evaluate the FF images and assist physicians with the diagnosis. The proteins known to be susceptible to aggregation are amyloid beta, α-synuclein, prions, transthyretin, tau, and other, such as lysozyme, beta 2 microglobulin, gelsolin, keratoepithelin, cystatin, immunoglobulin light chain AL, S-IBM, superoxide dismutase, and the leukocyte chemotactic factor 2. 

##### The signal emitted by these proteins may be fluorescent or infrared. 

##### The dye administration is topical, by injection into the eye, or by IV bolus injection into the bloodstream. The imaging detection of the labeling compound can be performed by an ophthalmology imaging device. The diagnostic test is based on the ability of a novel class of small molecules – “retinal contrast agents” – to bind amyloids and emit a strong fluorescent signal. Coupling the retinal contrast agent technology with AI-based feature extraction and DL approaches will facilitate the rapid and accurate diagnosis of neurodegenerative diseases associated with α-syn deposition. 

##### The tracer signals can be automatically quantified for the number of deposits, their shape, brightness, area or volume to build, for instance, sigmoid curve models for different biomarker metrics during pathogenesis or drug treatment. 

##### During treatment, differentially resistant aggregates exhibit different growth / killing curves and, at any given time point, could stop responding to treatment. Thus, I will model the changes in aggregate metrics as Markov chains with absorbing states and use Bayes rules statistics to build the model. Sigmoidal curves are modeled as the Gauss error function of aggregate growth based on fitting of volume values to sigmoidal growth models and evaluating the best fit with the objective after three to four longitudinal measurements to anticipate the speed of aggregate growth (state diagram automata). Retina image series contain populations of both quiescent and growing aggregates, which can switch their behavior between the two states at random moments or stochastically. 

##### The signaling that causes these switches is not understood. 

##### In my model of disease progression, the computer vision measurements deliver populations of metrics, and these reflect the reverse values of the transitional probabilities in a homogenous Markov chain model of this stochastic system. To acquire information on deviations with respect to the median behavior, I will record the probability distribution of the state switching probabilities by acquiring series of images of the same subjects with a time-step of a month and calculate the fraction of aggregates with changing morphology or other metrics. 

##### My customized biomedical computer vision software platform utilizes object (feature) level analyses, which include connected component labelling (Matov, A. et al. 2010), active contour model (Jones, TR., Carpenter, A., Golland, P. 2005), stationary wavelet transform (Olivo-Marin, JC. 2002), a difference of Gaussians transform (Lindberg, T. 1994), generalized Hough transform (Ballard, DH. 1981), Radon-like features (Kumar, R. et al. 2010), and Beamlet transform (Donoho, D., Levi, O. 2002), and pixel level analyses such as unimodal intensity histogram thresholding (Rosin, PL. 2001), Haralick texture features (Haralick, RM. 1983), and image Zernike moments (Murphy, RF. et al. 2003). 

##### My machine learning approach is based on a fully convolutional 3D neural network pipeline for object segmentation in image series. It leverages a model pre-trained on large-scale eye motion recognition tasks as a feature extractor (encoder) to enable unsupervised time-lapse image segmentation by generating pixel level eye masks without initialization. Convolutional neural networks (CNN) take into consideration multiple image representations, which might reveal different explanatory factors of variation behind the data. 

##### Scale-invariant feature transform (SIFT) (Lowe, DG. 2004), speeded-up robust feature (SURF) (Bay, H., Tuytelaars, T., van Gool, L. 2006), and oriented features from accelerated segment test and rotated binary robust independent elementary features (ORB) (Rublee, E., Rabaud, V., Konolige, K., Bradski, G. 2011) are applied to 3D raw or processed with a low-pass Gaussian spatial frequency filter (with a cut-off computationally fitted to the Bessel function forming the point-spread function of the imaging system (Thomann, D., Rines, R., Sorger, PK., Danuser, G. 2002), i.e., matched to the optical resolution limit of the collection frequency spectrum based on the dye emission wavelength and the diffraction limit of the objective) images to compute a faithful feature representation of the image stacks. 

##### Such image transformations allow the categorization, classification, and retrieval (reverse image search) of images based on the bag-of-visual-words (BoVW) (Csurka, G., Dance, CR., Fan, L., Willamowski, J., Bray, C. 2004) or bag-of-bags-of-words model (BBoW) (Ren, Y., Bugeau, A., Benois-Pineau, J. 2013). The image features consist of keypoints (each SIFT keypoint, for example, has coordinates, scale, and angular orientation) and descriptors (a SIFT descriptor is a 128-dimensional vector comprised of a gradient orientation histogram of the 16 by 16 pixels area around each keypoint), which construct vocabularies and represent each image as a quantized frequency histogram of features to identify similarities. The hyper-fluorescent area around the optical nerve head, the branching points of the blood vessels, and hyper-fluorescent fundus puncta are commonly detected features. 

##### BoVW and BBoW-based image retrieval can facilitate the medical diagnosis by identifying on-the-fly, in a database, examples of categories of similar, to a new patient retinal image presented for diagnosis, retinal phenotypes, which have already been assigned a diagnosis. 

##### To simultaneously optimize both the image segmentation and alignment (image registration) steps, the use of separable filters significantly reduces the computational burden of the 3D convolution, and the addition of dilation rates allows to capture multi-scale image representations without substantially increasing the computational cost of 3D convolution (Hou, R.Z., Chen, C., Sukthankar, R., Shah, M. 2019). 

##### Changes in the density and spatial organization of the retinal features and deviations from the baseline metrics are indicative of the development of a disease. The variety of modulations of the intrinsic retinal features is indicative of the differential physiology and protein dysregulation during pathogenesis. 

##### Changes in the density and spatial organization of the retinal features during drug treatment are indicative of treatment response. The variety of modulations of the retinal features upon drug treatment is indicative of different underlying molecular mechanisms of drug response and resistance to therapy. It can guide therapy toward optimal drug selection. 

##### Due to the rapid movement of the eye, even successive images can show significant 3D rotation, thus temporarily occluding some of the features. To address the problem of decision-making given incomplete information during classification, I utilize a Bayesian DL algorithm, which produces decision-making with epistemic uncertainty estimates (Chandra, R. Jain, K., Deo, RV., Cripps, S. 2019). 

##### I will integrate the same five time points for imaging (baseline auto-fluorescence, 2 minutes post-dye injection, 5 minutes post-dye injection, 15 minutes post-dye injection, 30 minutes post-dye injection). These image series allow computational tracking of the changes in the metrics of each feature in time and modeling the Bayesian inference to compute the posterior metrics distributions and quantify the uncertainty. The posterior distribution captures the set of model parameters, given the changes in feature metrics, and provides the ability to propagate the uncertainty in the pattern classification decision. 

##### To evaluate drug response, I classify image datasets as sensitive or resistant, and the differences in response reflect the type of disease and the mechanism of drug action. Based on clinical data for resistance, this analysis allows for the identification of an in vivo resistance baseline phenotype and the characterization of the changes in this phenotype, or lack thereof, after different treatments of refractory disease. This methodology allows performing minimally invasive in vivo companion diagnostics by evaluating the relative contribution of different misfolded or aggregated proteins in drug resistance and response via quantitative retinal imaging in patients with a number of neurodegenerative diseases originating in different areas of the central nervous system. Similarly, besides the predictive biomarkers, this methodology allows the discovery of prognostic biomarkers by performing an early detection of disease and advanced patient stratification analysis. 

##### Further, co-localizing FF images to cross-sectional tissue imaging obtained from optical coherence tomography (OCT) allows for additional disease differentiation and prognostics. Combining the Spectralis OCT imaging with the FF α-syn quantified images to generate 3D maps can identify unique structural and functional disease patterns, which can validate the AI-based diagnosis. http://dx.doi.org/10.13140/RG.2.2.35556.14728 (10 PDF files)

### For further information regarding database content-based image retrieval, please refer to: https://github.com/amatov/DifferentialDiagnosisCBIR
