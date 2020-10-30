<?php

namespace Kata\Tests;

use Kata\GiveAProperName;
use PHPUnit\Framework\TestCase;

class GiveAProperNameTest extends TestCase
{
    /** @test */
    public function please_rename_me_or_delete_me(): void
    {
        $myObject = new GiveAProperName();

        $result = $myObject->giveMeAProperName();

        self::assertEquals(true, $result);
    }
}
