package testimpl

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestComposableBackupInstanceBlobStorage(t *testing.T, ctx types.TestContext) {

	t.Run("validateBackupInstanceBlobStorage", func(t *testing.T) {

		instanceID := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"backup_instance_blob_storage_id",
		)

		assert.NotEmpty(t, instanceID)
	})
}
