#! /usr/bin/env julia
# Author Gaurav 
# Date 2024-7-5
# a snp variablity matrix to estimate and filter the variants for pangene alignments
# for faster rates, indexing the first element of the loop array, so that you dont have to traverse through the entire array. 


functionestimate(readfile, write)
    if readfile
     headers = Any[]
     sequenceAln = Any[]
     readaln = readlines(open(readfile))
     for i in 1:length(readaln)
         if startswith(readaln[i], ">")
             push!(headers,replace(chomp(readaln[i]), ">" => ""))
             push!(sequenceAln, chomp(readaln[i+1]))
         end
     end
     uppervariants = Any[]
     for i in 1:length(sequenceAln)
         push!(uppervariants, sequenceAln[i])
     end
     calibratesites = []
     for i in 1:length(variants)-1
         for j in 1:length(variants[1])-1
             if variants[i][j] != variants[i+1][j]
                 push!(calibratesites, variants[i][j], variants[i+1][j])
             end
         end
     end
      return calibratesites
    
    if readfile && write
     headers = Any[]
     sequenceAln = Any[]
     readaln = readlines(open(readfile))
     for i in 1:length(readaln)
         if startswith(readaln[i], ">")
             push!(headers,replace(chomp(readaln[i]), ">" => ""))
             push!(sequenceAln, chomp(readaln[i+1]))
         end
     end
     uppervariants = Any[]
     for i in 1:length(sequenceAln)
         push!(uppervariants, sequenceAln[i])
     end
     calibratesites = []
     for i in 1:length(variants)-1
         for j in 1:length(variants[1])-1
             if variants[i][j] != variants[i+1][j]
                 push!(calibratesites, variants[i][j], variants[i+1][j])
             end
         end
     end
     write("writefile", calibratesites)
end
