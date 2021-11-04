export HuberLoss, f1, recall, precision, LA, FEVER_measure

function HuberLoss(td_error::Number)
   if abs(td_error) <=1
        return td_error^2/2
    else
        return abs(td_error) - 1.2
    end
end

function HuberLoss(transitions, model)
    batch_total = 0.0
    for  i = 1:length(transitions)
        transition = transitions[i]
        td = model(transition...)
        batch_total += HuberLoss(td)
    end
    return batch_total / length(transitions)
end

function f1(precision,recall)
    return 2 * precision* recall/(precision+recall)
end
function f1(TP,FP,FN)
    return TP/(TP+(FP+FN)/2)
end
function recall(TP,FN)
    return TP/(FN+TP)
end
function precision(TP,FP)
    return TP/(TP+FP)
end

#LA -> Label Accuracy
function LA(pred_labels,ground_truth_labels)
    return mean(pred_labels .== ground_truth_labels)
end
#FEVER measure, specific to this task
function FEVER_measure(list_ground_truth,list_predictions)
    correct = 0.0
    for i = 1:length(list_ground_truth)
       ground = list_ground_truth[i]
       pred = list_predictions[i]
       included = 0 
       for j = 1:length(ground)
            for k = 1:length(pred)
                if pred[k] == ground[i]
                   included +=1
                   break 
                end
            end
        end
        if included == length(ground)
            correct +=1
        end
    end
    return correct / length(list_ground_truth)
end