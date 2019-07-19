import { combineReducers } from 'redux';

import giphysReducer from './giphys_reducer';

// export default combineReducers({
//     giphys: giphysReducer
// })

const rootReducer = (state = {}, action) => {
    Object.freeze(state);
    switch (action.type) {
        default:
            return state;
    }
    return {
        giphys: giphysReducer(state, action)
    }
} 

