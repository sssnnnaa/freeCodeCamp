import numpy as np

def calculate(list):
    if len(list) < 9:
        raise ValueError("List must contain nine numbers.")
    else:
        l = np.array(list)
        matrix = l.reshape((3,3))
        flattened_matrix = matrix.flatten()

        # Compute statistics along both axes and for the flattened matrix
        calculations = {
            'mean': [
                    np.mean(matrix, axis=0).tolist(),
                    np.mean(matrix, axis=1).tolist(),
                    np.mean(flattened_matrix).tolist()
                    ],
            'variance': [
                         np.var(matrix, axis=0).tolist(),
                         np.var(matrix, axis=1).tolist(),
                         np.var(flattened_matrix).tolist()
                        ],
            'standard deviation': [
                        np.std(matrix, axis=0).tolist(),
                        np.std(matrix, axis=1).tolist(),
                        np.std(flattened_matrix).tolist()
                       ],
            'max': [
                    np.max(matrix, axis=0).tolist(),
                    np.max(matrix, axis=1).tolist(),
                    np.max(flattened_matrix).tolist()
                   ],
            'min': [
                    np.min(matrix, axis=0).tolist(),
                    np.min(matrix, axis=1).tolist(),
                    np.min(flattened_matrix).tolist()
                   ],
            'sum': [ 
                    np.sum(matrix, axis=0).tolist(),
                    np.sum(matrix, axis=1).tolist(),
                    np.sum(flattened_matrix).tolist()
                   ]
        }



    return calculations