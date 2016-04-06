
model_config = dict(
        rfr={
            'params': {
                'n_estimators': 100,
                'criterion': 'mse',
                'max_features': None,  # max_features=n_features
                'n_jobs': -1,
                'oob_score': True,  # use out of bag samples to estimate error
                'verbose': False
            }
        }
)
